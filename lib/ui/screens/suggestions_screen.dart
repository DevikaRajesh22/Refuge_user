import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refuge_user/ui/widgets/custom_card.dart';
import 'package:refuge_user/ui/widgets/custom_icon_button.dart';
import 'package:refuge_user/util/value_validators.dart';

import '../../blocs/suggestion/suggestion_bloc.dart';
import '../widgets/custom_alert_dialog.dart';

class SuggestionsScreen extends StatefulWidget {
  const SuggestionsScreen({super.key});

  @override
  State<SuggestionsScreen> createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  final SuggestionBloc suggestionsBloc = SuggestionBloc();

  @override
  void initState() {
    super.initState();
    suggestionsBloc.add(GetAllSuggestionEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SuggestionBloc>.value(
      value: suggestionsBloc,
      child: BlocConsumer<SuggestionBloc, SuggestionState>(
        listener: (context, state) {
          if (state is SuggestionFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failed',
                message: state.message,
                primaryButtonLabel: 'Ok',
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: const BackButton(color: Colors.black45),
              centerTitle: false,
              elevation: 1,
              title: Text(
                'Suggestions',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddComplaintForm(
                    suggestionsBloc: suggestionsBloc,
                  ),
                );
              },
              backgroundColor: Colors.blue[900],
              icon: const Icon(Icons.add),
              label: const Text(
                'Add Suggestion',
              ),
            ),
            body: SafeArea(
              child: Expanded(
                child: state is SuggestionSuccessState
                    ? state.suggestions.isNotEmpty
                        ? ListView.separated(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 20,
                              right: 20,
                              bottom: 100,
                            ),
                            itemCount: state.suggestions.length,
                            itemBuilder: (context, index) => SuggestionsItem(
                              suggestionDetails: state.suggestions[index],
                              suggestionsBloc: suggestionsBloc,
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                          )
                        : const Center(child: Text('No suggestions found'))
                    : const Center(
                        child: CupertinoActivityIndicator(),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SuggestionsItem extends StatelessWidget {
  final SuggestionBloc suggestionsBloc;
  final dynamic suggestionDetails;
  const SuggestionsItem({
    super.key,
    required this.suggestionsBloc,
    this.suggestionDetails,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '#${suggestionDetails['id'].toString()}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                ),
                const Expanded(child: SizedBox()),
                CustomIconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomAlertDialog(
                        title: 'Delete?',
                        message: 'Are you sure you want to delete?',
                        primaryButtonLabel: 'Delete',
                        primaryOnPressed: () {
                          suggestionsBloc.add(
                            DeleteSuggestionEvent(
                              suggestionId: suggestionDetails['id'],
                            ),
                          );
                          Navigator.pop(context);
                        },
                        secondaryButtonLabel: 'No',
                      ),
                    );
                  },
                  iconData: Icons.delete_forever,
                  color: Colors.red,
                )
              ],
            ),
            const Divider(),
            Text(
              suggestionDetails['suggestion'],
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddComplaintForm extends StatefulWidget {
  final SuggestionBloc suggestionsBloc;
  const AddComplaintForm({
    super.key,
    required this.suggestionsBloc,
  });

  @override
  State<AddComplaintForm> createState() => _AddComplaintFormState();
}

class _AddComplaintFormState extends State<AddComplaintForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _desC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Add Suggestion',
      message: 'Enter the following details to add Suggestion.',
      content: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _desC,
              validator: alphaNumericValidator,
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Suggestion',
                prefixIcon: Icon(Icons.description),
              ),
            ),
          ],
        ),
      ),
      primaryButtonLabel: 'Add',
      primaryOnPressed: () {
        if (formKey.currentState!.validate()) {
          widget.suggestionsBloc.add(
            AddSuggestionEvent(
              suggestion: _desC.text.trim(),
            ),
          );
          Navigator.pop(context);
        }
      },
      secondaryButtonLabel: 'Cancel',
    );
  }
}
